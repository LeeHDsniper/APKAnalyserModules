.class Lcom/google/android/gms/analytics/internal/zzb$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/internal/zzb;->zza(Ljava/lang/String;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzLs:Lcom/google/android/gms/analytics/internal/zzb;

.field final synthetic zzLu:Ljava/lang/String;

.field final synthetic zzLv:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzb;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzb$3;->zzLs:Lcom/google/android/gms/analytics/internal/zzb;

    iput-object p2, p0, Lcom/google/android/gms/analytics/internal/zzb$3;->zzLu:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/analytics/internal/zzb$3;->zzLv:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzb$3;->zzLs:Lcom/google/android/gms/analytics/internal/zzb;

    invoke-static {v0}, Lcom/google/android/gms/analytics/internal/zzb;->zza(Lcom/google/android/gms/analytics/internal/zzb;)Lcom/google/android/gms/analytics/internal/zzl;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzb$3;->zzLu:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zzbg(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzb$3;->zzLv:Ljava/lang/Runnable;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzb$3;->zzLv:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_14
    return-void
.end method
