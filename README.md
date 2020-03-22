# WheelBoost
A helper application for high-class-taxi drivers.

## Deployment strategies:

### MVP VPS deployment strategy:
+ Connect to your VPS via SSH.
+ Configure two http(s) ports with firewall
+ Clone this repository
+ Inside `WheelBoost` folder, run this command: `git submodule update --init --recursive` 
+ After that, go to the `WheelBoost/deployment/mvpVpsDeploymentStrategy` and run `build.sh` script (make sure, that python3 is installed on your VPS before that!). 
+ Now you can run `run.sh`, then `ctrl + C` and `exit`.
+ (You can also use `monitor.sh` to check that all your API endpoints are working correctly)
