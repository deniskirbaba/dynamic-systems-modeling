from phaseportrait import PhasePortrait2D
from matplotlib import pyplot as plt
import numpy as np
import imageio


def func(x1, x2, *, r=1):
    return -x1, r * x2 + np.power(x2, 3) - np.power(x2, 5)


def func_0_0(x1, x2, *, r=1):
    return -x1, r * x2


def func_n_n(x1, x2, *, r=1):
    return -x1, (-4 * r - 1 + np.sqrt(4 * r + 1)) * x2


def func_p_n(x1, x2, *, r=1):
    return -x1, (-4 * r - 1 + np.sqrt(4 * r + 1)) * x2


def func_n_p(x1, x2, *, r=1):
    return -x1, (-4 * r - 1 - np.sqrt(4 * r + 1)) * x2


def func_p_p(x1, x2, *, r=1):
    return -x1, (-4 * r - 1 - np.sqrt(4 * r + 1)) * x2


def const(x_):
    return x_


def create_frame(t_):
    phase_port = PhasePortrait2D(func_n_n, [-1/4, 3],
                                 xlabel=r'$x_1$', ylabel=r'$x_2$', dF_args={'r': t_})
    plt.plot(0, 0, marker="o", markersize=5, markerfacecolor="green")
    # plt.plot(0, np.sqrt(1 + np.sqrt(4 * t_ + 1)) / np.sqrt(2), marker="o", markersize=5, markerfacecolor="green")
    # plt.plot(0, -np.sqrt(1 + np.sqrt(4 * t_ + 1)) / np.sqrt(2), marker="o", markersize=5, markerfacecolor="green")
    # plt.plot(0, np.sqrt(1 - np.sqrt(4 * t_ + 1)) / np.sqrt(2), marker="o", markersize=5, markerfacecolor="green")
    # plt.plot(0, -np.sqrt(1 - np.sqrt(4 * t_ + 1)) / np.sqrt(2), marker="o", markersize=5, markerfacecolor="green")
    # phase_port.add_slider('r', valinit=t_, valinterval=[-11.5, 5], valstep=0.5)
    fig, ax = phase_port.plot()
    plt.savefig(f'phase_portraits/l_n_n_img_{t_}.png',
                transparent=False,
                facecolor='white')
    plt.close()


for x in np.arange(-0.25, 3.1, 0.25):
    t = round(x, 1)
    create_frame(t)

frames = []
for x in np.arange(-0.25, 3.1, 0.25):
    t = round(x, 1)
    image = imageio.v2.imread(f'phase_portraits/img_{t}.png')
    frames.append(image)

imageio.mimsave('./phase_portraits/phase_portrait.gif', frames, fps=2)
