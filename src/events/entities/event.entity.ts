import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

import { Reservation } from './reservation.entity';

@Entity('events')
export class Event {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 100 })
    title: string;

    @Column({ type: 'timestamp' })
    date: Date;

    @Column({ type: 'int' })
    capacity: number;

    @Column({ name: 'available_spots', type: 'int' })
    availableSpots: number;

    @Column({ name: 'is_active', type: 'boolean', default: true })
    isActive: boolean;

    @OneToMany(() => Reservation, (reservation) => reservation.event)
    reservations: Reservation[];
}
