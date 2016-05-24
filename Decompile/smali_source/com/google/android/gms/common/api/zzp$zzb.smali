.class Lcom/google/android/gms/common/api/zzp$zzb;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zzb"
.end annotation


# instance fields
.field final synthetic zzaaR:Lcom/google/android/gms/common/api/zzp;

.field private final zzaaS:I

.field private final zzaaT:Lcom/google/android/gms/common/ConnectionResult;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/zzp;ILcom/google/android/gms/common/ConnectionResult;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaS:I

    iput-object p3, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaT:Lcom/google/android/gms/common/ConnectionResult;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzp;->zza(Lcom/google/android/gms/common/api/zzp;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzp;->zzb(Lcom/google/android/gms/common/api/zzp;)Z

    move-result v0

    if-eqz v0, :cond_11

    :cond_10
    :goto_10
    return-void

    :cond_11
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/api/zzp;->zza(Lcom/google/android/gms/common/api/zzp;Z)Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    iget v1, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaS:I

    invoke-static {v0, v1}, Lcom/google/android/gms/common/api/zzp;->zza(Lcom/google/android/gms/common/api/zzp;I)I

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaT:Lcom/google/android/gms/common/ConnectionResult;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/api/zzp;->zza(Lcom/google/android/gms/common/api/zzp;Lcom/google/android/gms/common/ConnectionResult;)Lcom/google/android/gms/common/ConnectionResult;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaT:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v0

    if-eqz v0, :cond_5a

    :try_start_2d
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzp;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->getFragments()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    shl-int/lit8 v0, v0, 0x10

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaT:Lcom/google/android/gms/common/ConnectionResult;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-virtual {v2}, Lcom/google/android/gms/common/api/zzp;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_52
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_2d .. :try_end_52} :catch_53

    goto :goto_10

    :catch_53
    move-exception v0

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzp;->zzc(Lcom/google/android/gms/common/api/zzp;)V

    goto :goto_10

    :cond_5a
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaT:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isUserRecoverableError(I)Z

    move-result v0

    if-eqz v0, :cond_7b

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaT:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v0}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/zzp;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->showErrorDialogFragment(ILandroid/app/Activity;Landroid/support/v4/app/Fragment;ILandroid/content/DialogInterface$OnCancelListener;)Z

    goto :goto_10

    :cond_7b
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    iget v1, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaS:I

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzp$zzb;->zzaaT:Lcom/google/android/gms/common/ConnectionResult;

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/common/api/zzp;->zza(Lcom/google/android/gms/common/api/zzp;ILcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_10
.end method
