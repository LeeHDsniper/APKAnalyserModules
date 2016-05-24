.class public Lcom/google/android/gms/common/GoogleApiAvailability;
.super Ljava/lang/Object;


# static fields
.field public static final GOOGLE_PLAY_SERVICES_VERSION_CODE:I

.field private static final zzYk:Lcom/google/android/gms/common/GoogleApiAvailability;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Lcom/google/android/gms/common/GooglePlayServicesUtil;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    sput v0, Lcom/google/android/gms/common/GoogleApiAvailability;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    new-instance v0, Lcom/google/android/gms/common/GoogleApiAvailability;

    invoke-direct {v0}, Lcom/google/android/gms/common/GoogleApiAvailability;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/GoogleApiAvailability;->zzYk:Lcom/google/android/gms/common/GoogleApiAvailability;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;
    .registers 1

    sget-object v0, Lcom/google/android/gms/common/GoogleApiAvailability;->zzYk:Lcom/google/android/gms/common/GoogleApiAvailability;

    return-object v0
.end method


# virtual methods
.method public isGooglePlayServicesAvailable(Landroid/content/Context;)I
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    invoke-static {p1, v0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->zzd(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_c

    const/16 v0, 0x12

    :cond_c
    return v0
.end method

.method public zzac(Landroid/content/Context;)V
    .registers 2

    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->zzac(Landroid/content/Context;)V

    return-void
.end method

.method public zzbb(I)Landroid/content/Intent;
    .registers 3

    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->zzbc(I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public zzd(Landroid/content/Context;I)Z
    .registers 4

    invoke-static {p1, p2}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->zzd(Landroid/content/Context;I)Z

    move-result v0

    return v0
.end method
