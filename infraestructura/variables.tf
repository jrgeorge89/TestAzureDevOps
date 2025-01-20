variable "resource_group_name" {
  description = "El nombre del grupo de recursos"
  type        = string
  default     = "techtest-resources"
}

variable "storage_account_name" {
  description = "El nombre de la cuenta de almacenamiento"
  type        = string
  default     = "techteststoracc"
}

variable "container_name" {
  description = "El nombre del contenedor de almacenamiento"
  type        = string
  default     = "content"
}

variable "location" {
  description = "La ubicación de los recursos"
  type        = string
  default     = "Brazil South"
}
