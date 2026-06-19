# Minimal container that serves the GWT Hardwood Floors static site.
# Build:  docker build -t gwt-floors .
# Run:    docker run -d -p 8080:80 --name gwt gwt-floors
# Visit:  http://localhost:8080

FROM nginx:1.27-alpine

# Remove the default nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy the static site (everything except the deploy/ folder).
# Run this build from the project root so these paths resolve.
COPY index.html services.html portfolio.html about.html faq.html \
     floor-care.html stain-gallery.html pricing.html /usr/share/nginx/html/
COPY style.css main.js /usr/share/nginx/html/

# Optional: use the tuned config (clean URLs, caching, gzip).
# This is a server-block-free variant of deploy/nginx.conf for in-container use.
COPY deploy/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
HEALTHCHECK CMD wget -qO- http://localhost/ >/dev/null 2>&1 || exit 1
