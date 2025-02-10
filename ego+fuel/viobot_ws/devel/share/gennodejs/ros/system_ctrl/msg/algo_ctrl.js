// Auto-generated. Do not edit!

// (in-package system_ctrl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class algo_ctrl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.algo_enable = null;
      this.algo_reboot = null;
      this.algo_reset = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('algo_enable')) {
        this.algo_enable = initObj.algo_enable
      }
      else {
        this.algo_enable = false;
      }
      if (initObj.hasOwnProperty('algo_reboot')) {
        this.algo_reboot = initObj.algo_reboot
      }
      else {
        this.algo_reboot = false;
      }
      if (initObj.hasOwnProperty('algo_reset')) {
        this.algo_reset = initObj.algo_reset
      }
      else {
        this.algo_reset = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type algo_ctrl
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [algo_enable]
    bufferOffset = _serializer.bool(obj.algo_enable, buffer, bufferOffset);
    // Serialize message field [algo_reboot]
    bufferOffset = _serializer.bool(obj.algo_reboot, buffer, bufferOffset);
    // Serialize message field [algo_reset]
    bufferOffset = _serializer.bool(obj.algo_reset, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type algo_ctrl
    let len;
    let data = new algo_ctrl(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [algo_enable]
    data.algo_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [algo_reboot]
    data.algo_reboot = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [algo_reset]
    data.algo_reset = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'system_ctrl/algo_ctrl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e37859a07726627da20d42fe4eb9bd2b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool algo_enable
    bool algo_reboot
    bool algo_reset
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new algo_ctrl(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.algo_enable !== undefined) {
      resolved.algo_enable = msg.algo_enable;
    }
    else {
      resolved.algo_enable = false
    }

    if (msg.algo_reboot !== undefined) {
      resolved.algo_reboot = msg.algo_reboot;
    }
    else {
      resolved.algo_reboot = false
    }

    if (msg.algo_reset !== undefined) {
      resolved.algo_reset = msg.algo_reset;
    }
    else {
      resolved.algo_reset = false
    }

    return resolved;
    }
};

module.exports = algo_ctrl;
