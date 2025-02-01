# Default target
.DEFAULT_GOAL := help

# Rust-related tasks
update:
	cargo update

fmt:
	cargo fmt --all

lint:
	cargo clippy --all-targets --all-features -- -D warnings

test:
	cargo test --all

build:
	cargo build --release

run:
	cargo run

audit:
	cargo-audit audit

prepush:
	cargo-audit audit
	cargo fmt --all
	cargo update
	cargo test --all

clean:
	cargo clean

# Docker-related tasks
docker-build:
	docker build -t rust-app .

docker-run:
	docker run --rm -it rust-app

docker-clean:
	docker rmi rust-app

# Help command
help:
	@echo "Available make commands:"
	@echo "  update        - Update Rust dependencies"
	@echo "  fmt           - Format Rust code"
	@echo "  lint          - Run Clippy for linting"
	@echo "  test          - Run tests"
	@echo "  build         - Build the project in release mode"
	@echo "  run           - Run the project"
	@echo "  clean         - Remove build artifacts"
	@echo "  docker-build  - Build the Docker image"
	@echo "  docker-run    - Run the Docker container"
	@echo "  docker-clean  - Remove the Docker image"
