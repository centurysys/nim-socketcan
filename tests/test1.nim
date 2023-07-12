import std/[unittest, options]
import socketcan


test "read write":
  let can0 = createCANSocket("vcan0")
  let can1 = createCANSocket("vcan0")

  let frame = CANFrame(
    id: CANId 1234,
    format: Extended,
    data: [1, 2, 3, 4, 5, 6, 7, 8],
    len: 8
  )

  check can0.write(frame)
  let frameReceived = can1.read()
  check frameReceived.isSome()
  check frameReceived.get() == frame
