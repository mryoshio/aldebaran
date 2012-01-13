require 'rubygems'
require 'active_cmis'

CmisSample::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  # setup CMIS repository
  $cmis_config = Hash.new
  $cmis_config["repo_id"] = "acae41c9-1717-492e-8b0a-410d888ff423"
  alfresco = ActiveCMIS::Server.new("http://127.0.0.1:8080/alfresco/service/cmis")
  alfresco.authenticate(:basic, 'admin', 'admin')
  $repo = alfresco.repository($cmis_config['repo_id'])
  $icons = {
    "application/x-javascript" =>"/alf_images/js.gif",
    "text/plain" => "/alf_images/text-file-32.png",
    "text/html" => "/alf_images/html.gif",
    "application/msword" => "/alf_images/doc.gif",
    "text/xml" => "/alf_images/xml.gif",
    "image/gif" => "/alf_images/gif.gif",
    "image/jpeg" => "/alf_images/img-file-32.png",
    "image/jpeg2000" => "/alf_images/jpg.gif",
    "video/mpeg" => "/alf_images/mpeg.gif",
    "audio/x-mpeg" => "/alf_images/mpg.gif",
    "video/mp4" => "/alf_images/mp4.gif",
    "video/mpeg2" => "/alf_images/mp2.gif",
    "application/pdf" => "/alf_images/pdf.gif",
    "image/png" => "/alf_images/png.gif",
    "application/vnd.powerpoint" => "/alf_images/ppt-file-32.png",
    "audio/x-wav" => "/alf_images/wmv.gif",
    "application/vnd.excel" => "/alf_images/xls-file-32.png",
    "application/zip" => "/alf_images/zip.gif",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" => "/alf_images/doc.gif",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" => "/alf_images/xls.gif",
    "application/vnd.openxmlformats-officedocument.presentationml.presentation" => "/alf_images/ppt.gif",
    "folder" => "alf_images/generic-folder-32.png"
  }

end
