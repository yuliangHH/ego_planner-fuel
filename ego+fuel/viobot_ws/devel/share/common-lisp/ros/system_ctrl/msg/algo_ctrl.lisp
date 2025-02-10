; Auto-generated. Do not edit!


(cl:in-package system_ctrl-msg)


;//! \htmlinclude algo_ctrl.msg.html

(cl:defclass <algo_ctrl> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (algo_enable
    :reader algo_enable
    :initarg :algo_enable
    :type cl:boolean
    :initform cl:nil)
   (algo_reboot
    :reader algo_reboot
    :initarg :algo_reboot
    :type cl:boolean
    :initform cl:nil)
   (algo_reset
    :reader algo_reset
    :initarg :algo_reset
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass algo_ctrl (<algo_ctrl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <algo_ctrl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'algo_ctrl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name system_ctrl-msg:<algo_ctrl> is deprecated: use system_ctrl-msg:algo_ctrl instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <algo_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:header-val is deprecated.  Use system_ctrl-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'algo_enable-val :lambda-list '(m))
(cl:defmethod algo_enable-val ((m <algo_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:algo_enable-val is deprecated.  Use system_ctrl-msg:algo_enable instead.")
  (algo_enable m))

(cl:ensure-generic-function 'algo_reboot-val :lambda-list '(m))
(cl:defmethod algo_reboot-val ((m <algo_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:algo_reboot-val is deprecated.  Use system_ctrl-msg:algo_reboot instead.")
  (algo_reboot m))

(cl:ensure-generic-function 'algo_reset-val :lambda-list '(m))
(cl:defmethod algo_reset-val ((m <algo_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:algo_reset-val is deprecated.  Use system_ctrl-msg:algo_reset instead.")
  (algo_reset m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <algo_ctrl>) ostream)
  "Serializes a message object of type '<algo_ctrl>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'algo_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'algo_reboot) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'algo_reset) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <algo_ctrl>) istream)
  "Deserializes a message object of type '<algo_ctrl>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'algo_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'algo_reboot) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'algo_reset) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<algo_ctrl>)))
  "Returns string type for a message object of type '<algo_ctrl>"
  "system_ctrl/algo_ctrl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'algo_ctrl)))
  "Returns string type for a message object of type 'algo_ctrl"
  "system_ctrl/algo_ctrl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<algo_ctrl>)))
  "Returns md5sum for a message object of type '<algo_ctrl>"
  "e37859a07726627da20d42fe4eb9bd2b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'algo_ctrl)))
  "Returns md5sum for a message object of type 'algo_ctrl"
  "e37859a07726627da20d42fe4eb9bd2b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<algo_ctrl>)))
  "Returns full string definition for message of type '<algo_ctrl>"
  (cl:format cl:nil "Header header~%bool algo_enable~%bool algo_reboot~%bool algo_reset~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'algo_ctrl)))
  "Returns full string definition for message of type 'algo_ctrl"
  (cl:format cl:nil "Header header~%bool algo_enable~%bool algo_reboot~%bool algo_reset~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <algo_ctrl>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <algo_ctrl>))
  "Converts a ROS message object to a list"
  (cl:list 'algo_ctrl
    (cl:cons ':header (header msg))
    (cl:cons ':algo_enable (algo_enable msg))
    (cl:cons ':algo_reboot (algo_reboot msg))
    (cl:cons ':algo_reset (algo_reset msg))
))
