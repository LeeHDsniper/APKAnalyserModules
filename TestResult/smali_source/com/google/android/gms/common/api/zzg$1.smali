.class Lcom/google/android/gms/common/api/zzg$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/common/api/zzg;->zznt()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzZK:Lcom/google/android/gms/common/api/zzg;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/zzg;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzg$1;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$1;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzb(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg$1;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v1}, Lcom/google/android/gms/common/api/zzg;->zza(Lcom/google/android/gms/common/api/zzg;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailability;->zzac(Landroid/content/Context;)V

    return-void
.end method
