# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.mpc.Debug:
/Users/virt/Developer/Self-Driving\ cars/batururimi/Term2/Model-Predictive-Control/ide_profiles/xcode/Debug/mpc:
	/bin/rm -f /Users/virt/Developer/Self-Driving\ cars/batururimi/Term2/Model-Predictive-Control/ide_profiles/xcode/Debug/mpc


PostBuild.mpc.Release:
/Users/virt/Developer/Self-Driving\ cars/batururimi/Term2/Model-Predictive-Control/ide_profiles/xcode/Release/mpc:
	/bin/rm -f /Users/virt/Developer/Self-Driving\ cars/batururimi/Term2/Model-Predictive-Control/ide_profiles/xcode/Release/mpc


PostBuild.mpc.MinSizeRel:
/Users/virt/Developer/Self-Driving\ cars/batururimi/Term2/Model-Predictive-Control/ide_profiles/xcode/MinSizeRel/mpc:
	/bin/rm -f /Users/virt/Developer/Self-Driving\ cars/batururimi/Term2/Model-Predictive-Control/ide_profiles/xcode/MinSizeRel/mpc


PostBuild.mpc.RelWithDebInfo:
/Users/virt/Developer/Self-Driving\ cars/batururimi/Term2/Model-Predictive-Control/ide_profiles/xcode/RelWithDebInfo/mpc:
	/bin/rm -f /Users/virt/Developer/Self-Driving\ cars/batururimi/Term2/Model-Predictive-Control/ide_profiles/xcode/RelWithDebInfo/mpc




# For each target create a dummy ruleso the target does not have to exist
