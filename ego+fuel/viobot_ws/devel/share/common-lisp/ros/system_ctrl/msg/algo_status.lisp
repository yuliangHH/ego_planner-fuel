; Auto-generated. Do not edit!


(cl:in-package system_ctrl-msg)


;//! \htmlinclude algo_status.msg.html

(cl:defclass <algo_status> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (algo_status
    :reader algo_status
    :initarg :algo_status
    :type cl:string
    :initform ""))
)

(cl:defclass algo_status (<algo_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <algo_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'algo_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name system_ctrl-msg:<algo_status> is deprecated: use system_ctrl-msg:algo_status instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <algo_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:header-val is deprecated.  Use system_ctrl-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'algo_status-val :lambda-list '(m))
(cl:defmethod algo_status-val ((m <algo_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:algo_status-val is deprecated.  Use system_ctrl-msg:algo_status instead.")
  (algo_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <algo_status>) ostream)
  "Serializes a message object of type '<algo_status>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'algo_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'algo_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <algo_status>) istream)
  "Deserializes a message object of type '<algo_status>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'algo_status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'algo_status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<algo_status>)))
  "Returns string type for a message object of type '<algo_status>"
  "system_ctrl/algo_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'algo_status)))
  "Returns string type for a message object of type 'algo_status"
  "system_ctrl/algo_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<algo_status>)))
  "Returns md5sum for a message object of type '<algo_status>"
  "ea3cca9ddd69cc9250ffcf7d901d6d13")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'algo_status)))
  "Returns md5sum for a message object of type 'algo_status"
  "ea3cca9ddd69cc9250ffcf7d901d6d13")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<algo_status>)))
  "Returns full string definition for message of type '<algo_status>"
  (cl:format cl:nil "Header header~%string algo_status~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'algo_status)))
  "Returns full string definition for message of type 'algo_status"
  (cl:format cl:nil "Header header~%string algo_status~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <algo_status>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'algo_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <algo_status>))
  "Converts a ROS message object to a list"
  (cl:list 'algo_status
    (cl:cons ':header (header msg))
    (cl:cons ':algo_status (algo_status msg))
))
