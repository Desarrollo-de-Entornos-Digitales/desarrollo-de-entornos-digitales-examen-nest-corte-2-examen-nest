import {
    Controller,
    UseGuards,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

import { User } from '@/auth/entities/user.entity';

@Controller('reservations')
@UseGuards(AuthGuard('jwt'))
export class ReservationController {
}
