import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { Event } from '../entities/event.entity';
import { Reservation } from '../entities/reservation.entity';

import {ReservationService} from './reservation.service';
import {ReservationController} from './reservation.controller';

@Module({
    imports: [TypeOrmModule.forFeature([Reservation, Event])],
    providers: [ReservationService],
    controllers: [ReservationController],
    exports: [ReservationService],
})
export class ReservationModule {}
