#Sprewell

Sprewell allows you to modify code during long running tasks. Sprewell creates a dot directory and runs a given command against the directory. 

```
gem install sprewell
cd your/project
sprewell "rspec spec/"
tail -f sprewell.log
```

