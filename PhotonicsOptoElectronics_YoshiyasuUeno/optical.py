import numpy as np
import matplotlib.pyplot as plt

# Constants
c = 299792458  # Speed of light in meters per second

# Parameters
center_wavelength = 1550e-9  # Center wavelength in meters
center_frequency = 200e12  # Center frequency in Hz
temporal_fwhm = 2e-12  # Temporal FWHM in seconds
temporal_distance = 6e-12  # Temporal distance between pulses in seconds
extension_factor = 10  # Factor by which to extend the time domain

# Frequency axis
max_frequency = center_frequency + 1 / (2 * temporal_distance)
frequency_resolution = 1 / (2 * temporal_fwhm)
frequencies = np.arange(center_frequency - max_frequency, center_frequency + max_frequency, frequency_resolution)

# Wavelength axis
wavelengths = c / frequencies

# Generate optical pulse train
time = np.arange(0, extension_factor * 10 * temporal_distance, 1e-14)  # Extended time axis
optical_pulse_train = np.zeros_like(time)

for t in np.arange(0, extension_factor * 10 * temporal_distance, temporal_distance):
    pulse = np.exp(-4 * np.log(2) * (time - t) ** 2 / temporal_fwhm ** 2)
    optical_pulse_train += pulse[:len(time)]  # Trim pulse to match time dimension

# Calculate FWHM
half_max = np.max(optical_pulse_train) / 2
indices = np.where(optical_pulse_train >= half_max)[0]
fwhm = time[indices[-1]] - time[indices[0]]

# Print FWHM
print(f"FWHM: {fwhm * 1e12:.2f} ps")

# Perform Fourier Transform
spectrum = np.fft.fftshift(np.fft.fft(optical_pulse_train))
optical_frequency = np.fft.fftshift(np.fft.fftfreq(len(time), d=time[1] - time[0])) + center_frequency

# Plot the original signal, wavelength spectrum, and optical-frequency spectrum
fig, (ax1, ax2, ax3) = plt.subplots(3, 1, figsize=(8, 10))
fig.subplots_adjust(hspace=0.5)

# Plot original signal
ax1.plot(time, optical_pulse_train)
ax1.set_xlabel('Time')
ax1.set_ylabel('Amplitude')
ax1.set_title('Original Signal')

# Plot wavelength spectrum
ax2.plot(wavelengths, np.abs(spectrum[:len(wavelengths)]))
ax2.set_xlabel('Wavelength (m)')
ax2.set_ylabel('Magnitude')
ax2.set_title('Wavelength Spectrum')

# Plot optical-frequency spectrum
ax3.plot(optical_frequency / 1e12, np.abs(spectrum))
ax3.set_xlabel('Optical Frequency (THz)')
ax3.set_ylabel('Magnitude')
ax3.set_title('Optical-Frequency Spectrum')

plt.tight_layout()
plt.show()


# Save wavelength spectra to file
wavelength_file_path = './Desktop/wavelength_spectra.txt'
with open(wavelength_file_path, 'w') as f:
    f.write("Wavelength Spectrum:\n")
    for wavelength, magnitude in zip(wavelengths, np.abs(spectrum)):
        f.write(f"Wavelength: {wavelength:.2e} m, Magnitude: {magnitude}\n")

# Save optical-frequency spectra to file
optical_frequency_file_path = './Desktop/optical_frequency_spectra.txt'
with open(optical_frequency_file_path, 'w') as f:
    f.write("Optical-Frequency Spectrum:\n")
    for frequency, magnitude in zip(optical_frequency, np.abs(spectrum)):
        f.write(f"Frequency: {frequency / 1e12:.2f} THz, Magnitude: {magnitude}\n")