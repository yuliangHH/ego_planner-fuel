#!/usr/bin/env python
import rospy
from sensor_msgs.msg import PointCloud2

current_cloud = None

def callback(data):
    global current_cloud
    current_cloud = data

def timer_callback(event):
    global current_cloud
    if current_cloud is not None:
        current_cloud.header.stamp = rospy.Time.now()
        pub.publish(current_cloud)

if __name__ == '__main__':
    rospy.init_node('cloud_relay', anonymous=True)

    pub = rospy.Publisher('/cloud/points_rdf', PointCloud2, queue_size=10)

    rospy.Subscriber('/pr_loop/points_rdf', PointCloud2, callback)

    rospy.Timer(rospy.Duration(0.05), timer_callback)

    rospy.spin()

