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

output "network" {
  description = "Name of VPC network connected with service producers using VPC peering."
  value       = google_service_networking_connection.private_service_connection.network
}

output "peering" {
  description = "The name of the VPC Network Peering connection that was created by the service producer."
  value       = google_service_networking_connection.private_service_connection.peering
}

output "service" {
  description = "Provider peering service that is managing peering connectivity for a service provider organization."
  value       = google_service_networking_connection.private_service_connection.service
}

output "reserved_peering_ranges" {
  description = "Named IP address range(s) of PEERING type reserved for this service provider."
  value       = google_service_networking_connection.private_service_connection.reserved_peering_ranges
}
