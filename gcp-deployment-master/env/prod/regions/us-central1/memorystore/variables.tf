variable "region" {
  description = "The GCP region to use."
  type        = string
  default     = null
}

variable "project" {
  description = "The ID of the project in which the resource belongs to."
  type        = string
}

variable "authorized_network" {
  description = "The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used."
  type        = string
  default     = null
}

variable "tier" {
  description = "The service tier of the instance. https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Tier"
  type        = string
  default     = "STANDARD_HA"
}

variable "memory_size_gb" {
  description = "Redis memory size in GiB. Defaulted to 1 GiB"
  type        = number
  default     = 1
}

variable "location_id" {
  description = "The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance. For STANDARD_HA tier, instances will be created across two zones for protection against zonal failures. If [alternativeLocationId] is also provided, it must be different from [locationId]."
  type        = string
  default     = null
}

variable "alternative_location_id" {
  description = "The alternative zone where the instance will be provisioned."
  type        = string
  default     = null
}

variable "redis_version" {
  description = "The version of Redis software."
  type        = string
  default     = null
}

variable "reserved_ip_range" {
  description = "The CIDR range of internal addresses that are reserved for this instance."
  type        = string
  default     = null
}

variable "connect_mode" {
  description = "The connection mode of the Redis instance. Can be either DIRECT_PEERING or PRIVATE_SERVICE_ACCESS. The default connect mode if not provided is DIRECT_PEERING."
  type        = string
  default     = null
}

variable "labels" {
  description = "The resource labels to represent user provided metadata."
  type        = map(string)
  default     = null
}
