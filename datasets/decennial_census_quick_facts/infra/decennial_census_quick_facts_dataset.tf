/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


resource "google_bigquery_dataset" "decennial_census_quick_facts" {
  dataset_id  = "decennial_census_quick_facts"
  project     = var.project_id
  description = "QuickFacts United States"
}

output "bigquery_dataset-decennial_census_quick_facts-dataset_id" {
  value = google_bigquery_dataset.decennial_census_quick_facts.dataset_id
}

resource "google_storage_bucket" "decennial-census-quick-facts" {
  name                        = "${var.bucket_name_prefix}-decennial-census-quick-facts"
  force_destroy               = true
  location                    = "US"
  uniform_bucket_level_access = true
  lifecycle {
    ignore_changes = [
      logging,
    ]
  }
}

output "storage_bucket-decennial-census-quick-facts-name" {
  value = google_storage_bucket.decennial-census-quick-facts.name
}
