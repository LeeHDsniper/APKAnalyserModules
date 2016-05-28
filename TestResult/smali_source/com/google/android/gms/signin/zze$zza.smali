.class public final Lcom/google/android/gms/signin/zze$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/signin/zze;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field private zzaLe:Ljava/lang/String;

.field private zzaOh:Z

.field private zzaOi:Z

.field private zzaOj:Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzzr()Lcom/google/android/gms/signin/zze;
    .registers 7

    new-instance v0, Lcom/google/android/gms/signin/zze;

    iget-boolean v1, p0, Lcom/google/android/gms/signin/zze$zza;->zzaOh:Z

    iget-boolean v2, p0, Lcom/google/android/gms/signin/zze$zza;->zzaOi:Z

    iget-object v3, p0, Lcom/google/android/gms/signin/zze$zza;->zzaLe:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/signin/zze$zza;->zzaOj:Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/signin/zze;-><init>(ZZLjava/lang/String;Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;Lcom/google/android/gms/signin/zze$1;)V

    return-object v0
.end method
