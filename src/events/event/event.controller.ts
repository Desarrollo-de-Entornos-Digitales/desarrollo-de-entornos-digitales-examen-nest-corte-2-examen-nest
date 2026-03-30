import {
    Controller,
    UseGuards,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

import {PermissionsGuard} from '@/common/guards/permissions.guard';

@Controller('events')
@UseGuards(AuthGuard('jwt'), PermissionsGuard)
export class EventController {

}
