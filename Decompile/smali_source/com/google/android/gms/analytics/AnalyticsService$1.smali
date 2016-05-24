.class Lcom/google/android/gms/analytics/AnalyticsService$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/analytics/internal/zzw;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/analytics/AnalyticsService;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzKf:I

.field final synthetic zzKg:Lcom/google/android/gms/analytics/internal/zzf;

.field final synthetic zzKh:Lcom/google/android/gms/analytics/internal/zzaf;

.field final synthetic zzKi:Lcom/google/android/gms/analytics/AnalyticsService;


# direct methods
.method constructor <init>(Lcom/google/android/gms/analytics/AnalyticsService;ILcom/google/android/gms/analytics/internal/zzf;Lcom/google/android/gms/analytics/internal/zzaf;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/analytics/AnalyticsService$1;->zzKi:Lcom/google/android/gms/analytics/AnalyticsService;

    iput p2, p0, Lcom/google/android/gms/analytics/AnalyticsService$1;->zzKf:I

    iput-object p3, p0, Lcom/google/android/gms/analytics/AnalyticsService$1;->zzKg:Lcom/google/android/gms/analytics/internal/zzf;

    iput-object p4, p0, Lcom/google/android/gms/analytics/AnalyticsService$1;->zzKh:Lcom/google/android/gms/analytics/internal/zzaf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzc(Ljava/lang/Throwable;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/analytics/AnalyticsService$1;->zzKi:Lcom/google/android/gms/analytics/AnalyticsService;

    invoke-static {v0}, Lcom/google/android/gms/analytics/AnalyticsService;->zza(Lcom/google/android/gms/analytics/AnalyticsService;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/analytics/AnalyticsService$1$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/analytics/AnalyticsService$1$1;-><init>(Lcom/google/android/gms/analytics/AnalyticsService$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
