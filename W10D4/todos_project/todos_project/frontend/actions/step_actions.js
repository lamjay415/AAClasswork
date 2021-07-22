export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";

export const receive_steps = (steps) => ({
    type: RECEIVE_STEPS,
    steps
})

export const receive_step = (step) => ({
    type: RECEIVE_STEP,
    step
})

export const remove_step = (step) => ({
    type: REMOVE_STEP,
    step
})