.PHONY: all targets imputation render sap clean

# Default target - run everything
all: render

# Run the main targets pipeline
targets:
	@echo "Running targets pipeline..."
	Rscript -e "targets::tar_make()"

# Render quarto documents
render:
	@echo "Rendering Quarto documents..."
	quarto render

# Clean targets cache and output
clean:
	@echo "Cleaning targets cache..."
	rm -rf _targets/
