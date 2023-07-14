locals { 
  #Standard execution command to execute a script on a remote host
  execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
}