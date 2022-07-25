# Copyright 2022 NephoSolutions srl, Sebastian Trebitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

data "google_compute_network" "network" {
  name = var.network
}

resource "google_compute_global_address" "private_service_connection" {
  for_each = toset(var.peering_ranges)

  address       = element(split("/", each.key), 0)
  address_type  = "INTERNAL"
  name          = "google-service-networking-${replace(each.key, "/[./]/", "-")}"
  network       = data.google_compute_network.network.name
  prefix_length = element(split("/", each.key), 1)
  purpose       = "VPC_PEERING"
}

resource "google_service_networking_connection" "private_service_connection" {
  network                 = data.google_compute_network.network.name
  reserved_peering_ranges = [for k, v in google_compute_global_address.private_service_connection : v.name]
  service                 = "servicenetworking.googleapis.com"
}
