.class Lcom/google/android/gms/internal/zzqr$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzqr;->zze(Ljava/lang/String;[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzQu:[B

.field final synthetic zzaUi:Ljava/lang/String;

.field final synthetic zzaUm:Lcom/google/android/gms/internal/zzqr;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzqr;Ljava/lang/String;[B)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqr$2;->zzaUm:Lcom/google/android/gms/internal/zzqr;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqr$2;->zzaUi:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqr$2;->zzQu:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqr$2;->zzaUm:Lcom/google/android/gms/internal/zzqr;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqr$2;->zzaUi:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqr$2;->zzQu:[B

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzqr;->zzf(Ljava/lang/String;[B)V

    return-void
.end method
