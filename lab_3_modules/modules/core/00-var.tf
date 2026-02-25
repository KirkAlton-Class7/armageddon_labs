variable "context" {
  type = object({
    region = string
    app  = string
    env  = string
    tags = map(string)
  })
}