import { Module } from '@nestjs/common';

import { EventModule } from './event/event.module';
import { ReservationModule } from './reservation/reservation.module';

@Module({
    imports: [EventModule, ReservationModule],
})
export class EventsModule {}
