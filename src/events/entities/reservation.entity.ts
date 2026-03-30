import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

import { User } from '@/auth/entities/user.entity';

import { Event } from './event.entity';

export enum ReservationStatus {
    ACTIVE = 'ACTIVE',
    CANCELLED = 'CANCELLED',
}

@Entity('reservations')
export class Reservation {
    @PrimaryGeneratedColumn()
    id: number;

    @ManyToOne(() => User, (user) => user.reservations, { nullable: false, onDelete: 'CASCADE' })
    @JoinColumn({ name: 'user_id' })
    user: User;

    @ManyToOne(() => Event, (event) => event.reservations, { nullable: false, onDelete: 'CASCADE' })
    @JoinColumn({ name: 'event_id' })
    event: Event;

    @Column({ type: 'int' })
    quantity: number;

    @Column({
        type: 'enum',
        enum: ReservationStatus,
        default: ReservationStatus.ACTIVE,
    })
    status: ReservationStatus;

    @Column({ name: 'created_at', type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    createdAt: Date;
}
