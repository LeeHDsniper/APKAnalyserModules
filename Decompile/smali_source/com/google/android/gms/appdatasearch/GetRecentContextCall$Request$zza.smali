.class public final Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field private zzPq:Landroid/accounts/Account;

.field private zzPr:Z

.field private zzPs:Z

.field private zzPt:Z

.field private zzPu:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzL(Z)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;
    .registers 2

    iput-boolean p1, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzPs:Z

    return-object p0
.end method

.method public zzbw(Ljava/lang/String;)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzPu:Ljava/lang/String;

    return-object p0
.end method

.method public zzlb()Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;
    .registers 7

    new-instance v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;

    iget-object v1, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzPq:Landroid/accounts/Account;

    iget-boolean v2, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzPr:Z

    iget-boolean v3, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzPs:Z

    iget-boolean v4, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzPt:Z

    iget-object v5, p0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request$zza;->zzPu:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Request;-><init>(Landroid/accounts/Account;ZZZLjava/lang/String;)V

    return-object v0
.end method
