# OcamlPress - [TODO] Still setting up

OcamlPress is a static site generator (SSG) built in OCaml, designed to transform markdown documents into a fully functional website. It's tailored for developers who appreciate the simplicity and power of OCaml and Markdown for generating static content.

## Features

- **Markdown to HTML Conversion**: Converts Markdown files into HTML, maintaining the integrity of code syntax highlighting, tables, and other Markdown features.
- **Template Engine**: Utilizes a simple yet powerful template engine for custom designs and layouts.
- **Site Configuration**: Supports site-wide settings through a simple configuration file.
- **Navigation Generation**: Automatically generates navigation links based on the directory structure or predefined configuration.
- **Static Asset Management**: Efficiently handles static assets such as images and CSS, preserving the directory structure in the output.
- **Live Reload (Development Mode)**: Offers a live-reload server for real-time preview during development.

## Getting Started

### Prerequisites

Ensure you have OCaml and OPAM installed on your system. For installation instructions, visit [OCaml's official site](https://ocaml.org/).

### Installation

Clone the OcamlPress repository:

```bash
git clone git@github.com:chizy7/ocamlpress.git
cd ocamlpress
```

### Install dependencies

```bash
opam install . --deps-only
```

### Build the project

```bash
make build
```

### Usage

To generate the site:

```bash
make run
```

For development mode with live reload, run:

```bash
make dev
```