import { Type } from 'class-transformer';
import { IsInt, Max, Min } from 'class-validator';

export class CreateReservationDto {
    eventId: number;
    quantity: number;
}
