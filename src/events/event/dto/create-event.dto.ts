import { IsDateString, IsInt, IsString, Length, Min } from 'class-validator';

export class CreateEventDto {
    title: string;
    date: string;
    capacity: number;
}
