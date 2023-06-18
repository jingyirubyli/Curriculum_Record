import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import pandas as pd

def modulated_lightwave_signal(A, m, p, beta0, beta1, beta2, z, t):
    omega = beta0 + beta1 * p + (beta2 * p**2) / 2
    phase_term = np.exp(1j * (omega * t - beta0 * z - beta1 * p * z - (beta2 * p**2 * z) / 2))
    amplitude_term = A * np.exp(1j * m * np.cos(p * (t - beta1 * z)))
    return amplitude_term * phase_term

# Parameters
A = 1.0  # Amplitude of the lightwave before modulation
m = 0.5  # Modulation index
p = 10.0  # Angular frequency of modulation
beta0 = 0.5  # Propagation constant at angular frequency ω0
beta1 = 0.2  # Coefficient for linear frequency dependence
beta2 = 0.1  # Coefficient for quadratic frequency dependence
z = np.linspace(0, 50, 1000)  # Fiber length
t = np.linspace(0, 20, 1000)  # Time
# t = np.array([20.0])  # Time (specific time point)

# Create meshgrid of z and t
Z, T = np.meshgrid(z, t)

# Compute the modulated lightwave signal at different fiber lengths and times
signal = modulated_lightwave_signal(A, m, p, beta0, beta1, beta2, np.reshape(z, (-1, 1)), t)

# Find the index where the amplitude component at angular frequency p becomes extinct
extinction_index = np.argmax(np.abs(signal[:, np.argmax(t)]))  # Find the index of the maximum amplitude
extinction_point = (z[extinction_index], t[np.argmax(t)], signal[extinction_index, np.argmax(t)].real)

# Plot the real and imaginary components of the modulated lightwave signal
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.plot_surface(np.tile(z, (len(t), 1)).T, np.tile(t, (len(z), 1)), signal.real, cmap='viridis', edgecolor='none')
ax.plot_surface(np.tile(z, (len(t), 1)).T, np.tile(t, (len(z), 1)), signal.imag, cmap='inferno', edgecolor='none')
ax.set_xlabel('Fiber Length (z)')
ax.set_ylabel('Time (t)')
ax.set_zlabel('Signal Value')
ax.set_title('Modulated Lightwave Signal')
ax.scatter(z[extinction_index], t[np.argmax(t)], signal[extinction_index, np.argmax(t)].real, color='red', s=50, label='Extinction Point')
ax.text(z[extinction_index], t[np.argmax(t)], signal[extinction_index, np.argmax(t)].real, f'({extinction_point[0]:.2f}, {extinction_point[1]:.2f}, {extinction_point[2]:.2f})', color='red')
ax.legend()
# plt.show()

# Plot the real and imaginary components of the modulated signal at angular frequency p as a function of fiber length
plt.figure()
plt.plot(z, signal[:, np.argmax(t)].real, label=f"Real Component, p = {p}")
plt.plot(z, signal[:, np.argmax(t)].imag, label=f"Imaginary Component, p = {p}")
plt.xlabel("Fiber Length (z)")
plt.ylabel("Signal Value")
plt.title("Modulated Lightwave Signal at Angular Frequency p")
plt.legend()
plt.show()

# Find the index where the amplitude component at angular frequency p becomes extinct
extinction_index = np.argmax(np.abs(signal[:, np.argmax(t)]))  # Find the index of the maximum amplitude

# Print the coordinates of the extinction point
print(f"Extinction Point: ({extinction_point[0]:.2f}, {extinction_point[1]:.2f}, {extinction_point[2]:.2f})")

# Create a table with the parameters and results
data = {
    'Parameter': ['A', 'm', 'p', 'beta0', 'beta1', 'beta2', 'Extinction Point'],

    'Value': [A, m, p, beta0, beta1, beta2, extinction_point]
}
df = pd.DataFrame(data)
print(data)

# Plot the real and imaginary components of the modulated lightwave signal
fig = plt.figure(figsize=(12, 5))

# 2D Plot of Extinction Point as a Function of Fiber Length
ax1 = fig.add_subplot(121)
ax1.plot(z, np.abs(signal[extinction_index, :]), label=f"Amplitude Component, p = {p}")
ax1.plot(z[extinction_index], np.abs(signal[extinction_index, np.argmax(t)]), 'ro', label="Extinction Point")
ax1.set_xlabel("Fiber Length (z)")
ax1.set_ylabel("Signal Amplitude")
ax1.set_title("Amplitude Component at Angular Frequency p")
ax1.legend()

# 3D Plot of the Modulated Lightwave Signal
ax2 = fig.add_subplot(122, projection='3d')
ax2.plot_surface(np.tile(z, (len(t), 1)).T, np.tile(t, (len(z), 1)), signal.real, cmap='viridis', edgecolor='none')
ax2.plot_surface(np.tile(z, (len(t), 1)).T, np.tile(t, (len(z), 1)), signal.imag, cmap='inferno', edgecolor='none')
ax2.set_xlabel('Fiber Length (z)')
ax2.set_ylabel('Time (t)')
ax2.set_zlabel('Signal Value')
ax2.set_title('Modulated Lightwave Signal')
ax2.scatter(z[extinction_index], t[np.argmax(t)], signal[extinction_index, np.argmax(t)].real, color='red', s=50, label='Extinction Point')
ax2


# # Create a 3D plot of the real and imaginary components of the modulated signal at angular frequency p
# fig = plt.figure()
# ax1 = fig.add_subplot(211, projection='3d')
# ax1.plot_surface(Z, T, signal.real, cmap='viridis', edgecolor='none')
# ax1.set_xlabel('Fiber Length (z)')
# ax1.set_ylabel('Time (t)')
# ax1.set_zlabel('Real Component')
# ax1.set_title('Modulated Lightwave Signal (Real Component)')

# ax2 = fig.add_subplot(212, projection='3d')
# ax2.plot_surface(Z, T, signal.imag, cmap='viridis', edgecolor='none')
# ax2.set_xlabel('Fiber Length (z)')
# ax2.set_ylabel('Time (t)')
# ax2.set_zlabel('Imaginary Component')
# ax2.set_title('Modulated Lightwave Signal (Imaginary Component)')
# plt.show()