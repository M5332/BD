# Online Wedding Invitation

A one-page, static Angular wedding invitation with an animated guide mascot, event schedule, calendar link, and RSVP link.

## Run locally

```bash
npm start
```

Open [http://localhost:4200](http://localhost:4200).

## Personalize the invitation

- Update the names, date, venue, and video path in `src/app/app.component.ts`.
- Update the page title and description in `src/index.html`.
- Add the couple's MP4 invitation film at `public/assets/wedding-invitation.mp4`. The video is set to autoplay muted, loop, and play inline. Visitors can turn the sound on with the sound button. Autoplay with sound is blocked by most browsers.
- Until the film is added, the page shows an animated invitation fallback. Guests can also choose a local video file to preview it in their browser.
- Update the date, times, and venue details in the component. Change the Google Calendar event dates in `calendarUrl` to match the wedding date.
- The RSVP button opens WhatsApp with a pre-filled message; guests choose who to send it to.

This project is a static front end and does not store RSVPs or collect guest information.

## Production build

```bash
npm run build
```

The generated site is in `dist/wedding-invitation/browser` and can be deployed to any static web host.

## Deploy to AKS

The repository-level GitHub Actions workflow builds this project into an NGINX container, pushes it to Azure Container Registry, and deploys it to AKS with Helm. The deployed site is served under `/wedding/` using an NGINX ingress path rule.

1. Apply `az_tf` with a globally unique `acr_name`. Set `github_actions_principal_id` to the object ID of the service principal used by the workflow to grant it `AcrPush`. Set `dns_zone_name` to a domain hosted in Azure DNS and `dns_record_name` to the desired label (or `@` for the zone apex); leave the zone empty to skip DNS creation.
2. Set repository Actions variables `ACR_NAME`, `AKS_RESOURCE_GROUP`, `AKS_CLUSTER_NAME`, and `WEDDING_HOST`. `ACR_NAME` must match Terraform, and `WEDDING_HOST` must match the Terraform DNS record. Set `INGRESS_PUBLIC_IP` to the Terraform `ingress_public_ip` output if the workflow identity cannot read public IP resources.
3. Add the `AZURE_CREDENTIALS` Actions secret for a service principal with AKS access and the Terraform-granted `AcrPush` role.
4. Push a change to `main` or `deploy`, or run the `Build and deploy wedding invitation` workflow manually.

To manage the wedding app from GitHub Actions, open **Actions > Build and deploy wedding invitation > Run workflow** and select:

- `deploy` - build and push the image, ensure the ingress controller is installed, and deploy or upgrade the Helm release.
- `uninstall` - uninstall only the `wedding-invitation` Helm release while leaving AKS, ACR, DNS, and the ingress controller in place.
- `check-infra` - verify the AKS cluster, ingress controller, Helm release, ACR, public IP, and configured DNS hostname.

The Terraform DNS zone must be delegated to the Azure nameservers shown in the zone before the hostname resolves publicly.
