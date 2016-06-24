import os
import rospy

def drivearound():
	rospy.init_node("drivearound_robot")
	print "ROS Node URI:", rospy.get_node_uri()
	print "ROS Time:", rospy.get_rostime()
	print "ROS_ROOT:", rospy.get_ros_root()

if __name__ == "__main__":
	drivearound()
