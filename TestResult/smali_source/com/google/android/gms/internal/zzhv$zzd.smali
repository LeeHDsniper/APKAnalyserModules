.class Lcom/google/android/gms/internal/zzhv$zzd;
.super Lcom/google/android/gms/internal/zzhv$zzf;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzhv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zzd"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzhv$zzf;-><init>()V

    return-void
.end method


# virtual methods
.method public getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    invoke-static {p1}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Landroid/content/Context;Landroid/webkit/WebSettings;)Z
    .registers 4

    invoke-super {p0, p1, p2}, Lcom/google/android/gms/internal/zzhv$zzf;->zza(Landroid/content/Context;Landroid/webkit/WebSettings;)Z

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    const/4 v0, 0x1

    return v0
.end method
