resource "google_compute_forwarding_rule" "lb-fw" {
  name                  = "reddit-app"
  description           = "lb rule for reddit apps"
  port_range            = "9292"
  target                = "${google_compute_target_pool.lb.self_link}"
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_target_pool" "lb" {
  name          = "reddit-lb"
  description   = "lb for reddit apps"
  instances     = "${google_compute_instance.app.*.self_link}"
  health_checks = ["${google_compute_http_health_check.default.name}"]
}

resource "google_compute_http_health_check" "default" {
  name                = "reddit-app-hc"
  port                = 9292
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 5
}
