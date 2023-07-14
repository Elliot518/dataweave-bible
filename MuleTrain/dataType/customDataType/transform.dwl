%dw 2.0
output application/json
type Currency = String {format: '###.00'}
---
flights: payload map (item, index) -> {
    dest: item.toAirportCode,
    price: item.price as Currency,
    totalSeats: item.totalSeats,
    plane: upper(item.planeType),
    date: item.departureDate as Date {format: 'dd-MM-yyyy'} as String {format: 'yyyy-MM-dd'}
}
