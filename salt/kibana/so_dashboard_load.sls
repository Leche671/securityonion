include:
  - kibana

dashboard_saved_objects_template:
  file.managed:
    - name: /opt/so/conf/kibana/saved_objects.ndjson
    - source: salt://kibana/files/saved_objects.ndjson
    - user: 932
    - group: 939
    - show_changes: False

so-kibana-dashboard-load:
  cmd.run:
    - name: /usr/sbin/so-kibana-config-load -i /opt/so/conf/kibana/saved_objects.ndjson
    - cwd: /opt/so
    - require:
      - sls: kibana
      - file: dashboard_saved_objects_template
