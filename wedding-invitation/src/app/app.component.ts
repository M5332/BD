import { Component, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-root',
  imports: [],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent implements OnDestroy {
  readonly invitation = {
    partnerOne: 'Aarav',
    partnerTwo: 'Ananya',
    date: 'Sunday, 25 October 2026',
    venue: 'The Garden House, Jaipur',
    videoPath: 'assets/wedding-invitation.mp4'
  };

  readonly events = [
    { time: '4:00 PM', name: 'Welcome & garden stroll', note: 'Come as you are; we’ll save you a seat.' },
    { time: '5:00 PM', name: 'The ceremony', note: 'The moment we’ve been dreaming of.' },
    { time: '6:30 PM', name: 'Dinner & dancing', note: 'Stay for a toast, a song, and one more dance.' }
  ];

  readonly guideSteps = [
    { title: 'Your invitation film', text: 'Press play on the film below. It starts muted so it can play automatically; tap the sound button whenever you’re ready.' },
    { title: 'Save the celebration', text: 'The date, venue, and full evening schedule are just below the film. Tap “Add to calendar” to keep the day close.' },
    { title: 'Let us know you’re coming', text: 'At the bottom of the page, choose “Count me in” to send a quick RSVP message. We can’t wait to celebrate with you.' }
  ];

  guideOpen = true;
  guideStep = 0;
  videoHasError = false;
  videoMessage = '';
  videoMuted = true;
  private videoObjectUrl?: string;

  get guideProgress(): string {
    return `${this.guideStep + 1} / ${this.guideSteps.length}`;
  }

  get calendarUrl(): string {
    const start = '20261025T160000';
    const end = '20261025T230000';
    const title = encodeURIComponent(`${this.invitation.partnerOne} & ${this.invitation.partnerTwo} — Wedding celebration`);
    const details = encodeURIComponent('We can’t wait to celebrate together. See you there!');
    const location = encodeURIComponent(this.invitation.venue);
    return `https://calendar.google.com/calendar/render?action=TEMPLATE&text=${title}&dates=${start}/${end}&details=${details}&location=${location}`;
  }

  get rsvpUrl(): string {
    const message = encodeURIComponent(`Hi! I’m replying to ${this.invitation.partnerOne} & ${this.invitation.partnerTwo}’s wedding invitation. I’d love to celebrate with you!`);
    return `https://wa.me/?text=${message}`;
  }

  nextGuideStep(): void {
    if (this.guideStep < this.guideSteps.length - 1) {
      this.guideStep += 1;
    } else {
      this.guideOpen = false;
    }
  }

  toggleGuide(): void {
    if (!this.guideOpen) this.guideStep = 0;
    this.guideOpen = !this.guideOpen;
  }

  onVideoError(): void {
    this.videoHasError = true;
    if (this.videoObjectUrl) {
      this.videoMessage = 'This video could not be loaded. Try choosing an MP4 video instead.';
    }
  }

  toggleVideoAudio(video: HTMLVideoElement): void {
    this.videoMuted = !this.videoMuted;
    video.muted = this.videoMuted;
    if (!this.videoMuted) {
      void video.play().catch(() => {
        this.videoMuted = true;
        video.muted = true;
        this.videoMessage = 'This video could not start playing. Try choosing an MP4 video instead.';
        this.videoHasError = true;
      });
    }
  }

  onVideoSelected(event: Event, video: HTMLVideoElement): void {
    const file = (event.target as HTMLInputElement).files?.[0];
    if (!file) return;

    if (!file.type.startsWith('video/')) {
      this.videoHasError = true;
      this.videoMessage = 'Please choose a video file to preview your invitation.';
      return;
    }

    this.videoHasError = false;
    this.videoMessage = '';
    this.videoMuted = true;
    if (this.videoObjectUrl) URL.revokeObjectURL(this.videoObjectUrl);
    this.videoObjectUrl = URL.createObjectURL(file);
    video.src = this.videoObjectUrl;
    void video.play().catch(() => {
      this.videoHasError = true;
      this.videoMessage = 'This video could not start playing. Try choosing an MP4 video instead.';
    });
  }

  ngOnDestroy(): void {
    if (this.videoObjectUrl) URL.revokeObjectURL(this.videoObjectUrl);
  }
}
