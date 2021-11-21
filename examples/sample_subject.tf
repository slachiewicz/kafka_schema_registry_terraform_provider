terraform {
  required_providers {
    schemaregistry = {
      source = "github.com/francescop/schemaregistry"
      version = "1.0.0"
    }
  }
}

provider "schemaregistry" {
  uri = "http://localhost:8081"
}

resource "schemaregistry_subject" "schema_sample_from_string" {
  subject = "com.test.myapp.test-from-string"
  schema  = "{\"type\":\"record\",\"name\":\"payments\",\"namespace\":\"my.examples\",\"fields\":[{\"name\":\"id\",\"type\":\"string\"},{\"name\":\"amount\",\"type\":\"double\"}]}"
}

resource "schemaregistry_config" "schema_sample_from_string_config" {
  subject = "com.test.myapp.test-from-string"
  config  = "{\"compatibility\":\"FORWARD\"}"
}

// from file need review
//resource "schemaregistry_subject" "schema_sample_from_file" {
//  subject = "com.test.myapp.test-from-file"
//  schema  = "${file("schema_sample.avro.json")}"
//}

resource "schemaregistry_config" "schema_sample_config_2" {
  subject = "com.test.myapp.test-from-string-2"
  config  = "{\"compatibility\":\"BACKWARD\"}"
}
