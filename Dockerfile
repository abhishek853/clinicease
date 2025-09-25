# Use Nginx official image
FROM nginx:alpine

# Copy website files into Nginx html folder
COPY MyHospital-master/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80
