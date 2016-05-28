.class Lcom/google/android/gms/analytics/internal/zzi$zza$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/internal/zzi$zza;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzMd:Lcom/google/android/gms/analytics/internal/zzac;

.field final synthetic zzMe:Lcom/google/android/gms/analytics/internal/zzi$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzi$zza;Lcom/google/android/gms/analytics/internal/zzac;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$1;->zzMe:Lcom/google/android/gms/analytics/internal/zzi$zza;

    iput-object p2, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$1;->zzMd:Lcom/google/android/gms/analytics/internal/zzac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$1;->zzMe:Lcom/google/android/gms/analytics/internal/zzi$zza;

    iget-object v0, v0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$1;->zzMe:Lcom/google/android/gms/analytics/internal/zzi$zza;

    iget-object v0, v0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v1, "Connected to service after a timeout"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzi;->zzaZ(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$1;->zzMe:Lcom/google/android/gms/analytics/internal/zzi$zza;

    iget-object v0, v0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$1;->zzMd:Lcom/google/android/gms/analytics/internal/zzac;

    invoke-static {v0, v1}, Lcom/google/android/gms/analytics/internal/zzi;->zza(Lcom/google/android/gms/analytics/internal/zzi;Lcom/google/android/gms/analytics/internal/zzac;)V

    :cond_1c
    return-void
.end method
