.class Lcom/google/android/gms/analytics/internal/zzi$zza$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/internal/zzi$zza;->onServiceDisconnected(Landroid/content/ComponentName;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzMe:Lcom/google/android/gms/analytics/internal/zzi$zza;

.field final synthetic zzMf:Landroid/content/ComponentName;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/internal/zzi$zza;Landroid/content/ComponentName;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$2;->zzMe:Lcom/google/android/gms/analytics/internal/zzi$zza;

    iput-object p2, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$2;->zzMf:Landroid/content/ComponentName;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$2;->zzMe:Lcom/google/android/gms/analytics/internal/zzi$zza;

    iget-object v0, v0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza$2;->zzMf:Landroid/content/ComponentName;

    invoke-static {v0, v1}, Lcom/google/android/gms/analytics/internal/zzi;->zza(Lcom/google/android/gms/analytics/internal/zzi;Landroid/content/ComponentName;)V

    return-void
.end method
