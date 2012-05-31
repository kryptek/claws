require 'yaml'

module Claws
  module Command
    class Initialize
      def self.exec
        h = {
          'capistrano' => {
            'home' => ENV['HOME'] || nil,
          },
          'ssh' => {
            'user' => ENV['USER'],
          },
          'aws' => {
            'access_key_id' => ENV['AWS_ACCESS_KEY_ID'] || nil,
            'secret_access_key' => ENV['AWS_SECRET_ACCESS_KEY'] || nil,
          },
          'ec2' => {
            'fields' => {
              'id' => {
                'width' => 10,
                'title' => 'ID',
              },
              'name' => {
                'width' => 20,
                'title' => 'Name',
              },
              'status' => {
                'width' => 8,
                'title' => 'Status',
              },
              'dns_name' => {
                'width' => 42,
                'title' => 'DNS Name',
              },
              'instance_type' => {
                'width' => 13,
                'title' => 'Instance Type',
              },
              'public_ip_address' => {
                'width' => 16,
                'title' => 'Public IP',
              },
              'private_ip_address' => {
                'width' => 16,
                'title' => 'Private IP',
              },
              'tags' => {
                'width' => 30,
                'title' => 'tags',
              },
            },
          }
        }

        conf = File.join(ENV['HOME'], '.claws.yml')
        puts "Creating configuration file: #{conf}\n..."
        File.open(conf, 'w').write(h.to_yaml)
        puts 'Complete!'
      end
    end
  end
end
