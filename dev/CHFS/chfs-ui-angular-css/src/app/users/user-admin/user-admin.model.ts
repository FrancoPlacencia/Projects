export interface UserAdmin {
    firstName: string;

    lastName: string;

    email: string;

    title: string;

    bio: string | undefined;

    isActive: boolean;

    isLocked: boolean;

    usingMfa: boolean;

    createdOn: Date;

    role: string;
}
