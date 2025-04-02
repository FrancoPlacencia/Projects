'use client'

import { FormProvider, useForm } from "react-hook-form";
import { Input } from "./Input";


export const TournamentForm = () => {
    const methods = useForm()
    return (
        <FormProvider {...methods}>
            <form>
                <div className="container mt-5 text-center">
                    <div className="grid gap-5 md:grid-cols-2">
                        <Input
                            name="Name"
                            label="name"
                            type="text"
                            id="name"
                            placeholder="type your name..."></Input>
                        <Input
                            name="Name"
                            label="last name"
                            type="text"
                            id="lastname"
                            placeholder="type your last name..."></Input>
                    </div>
                </div>
            </form>
        </FormProvider>
    );
}


