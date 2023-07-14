%dw 2.0
output application/dw
type Currency = String {format: '###.00$'}
---
flights: payload map (item, index) -> {
    dest: item.toAirportCode,
    price: item.price as Currency,
    totalSeats: item.totalSeats,
    plane: upper(item.planeType),
    date: item.departureDate as Date {format: "yyyy/MM/dd"}
}
